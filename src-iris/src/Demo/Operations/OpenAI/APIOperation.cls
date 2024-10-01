Class Demo.Operations.OpenAI.APIOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER;

Parameter INVOCATION = "Queue";

/// These are the production settings for this object
Parameter SETTINGS = "Model:OpenAI,CustomModel:OpenAI,ChatBotInstructions:OpenAI,APIKeyCredentials:OpenAI:credentialsSelector";

/// Model used in operation.
Property Model As %String(VALUELIST = ",gpt-4o-mini,gpt-4o,gpt-4-turbo,gpt-3.5-turbo");

/// Custom model (Use for models not in list. Property 'Model' will be ignored. See https://huggingface.co/models).
Property CustomModel As %String;

/// This is the ID of the credentials containing the OpenAI projectID and key where the 
/// username property contains the projectID and the password property the project API key.
/// Leave username (projectID) empty to use the default project.
Property APIKeyCredentials As %String;

Property ChatBotInstructions As %String(MAXLEN = 256);

/// Huggingface InferenceClient client
Property Client As %SYS.Python [ Private ];

/// json.dumps reference
Property ToJson As %SYS.Python [ Private ];

Property ActualModel As %String [ Private ];

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.GenerateRequest">
    <Method>OnGenerateRequest</Method>
  </MapItem>
</MapItems>
}

Method OnGenerateRequest(pRequest As Demo.GenerateRequest, Output pResponse As Demo.Operations.OpenAI.OpenAIResponse) As %Status
{
    #dim sc As %Status = $$$OK
    Set pResponse = ##class(Demo.Operations.OpenAI.OpenAIResponse).%New()
    try {
        Do pResponse.%JSONImport(..GenerateRequest(pRequest))
    } catch ex {
        set sc = ex.AsStatus()
    }

    quit sc
}

Method GenerateRequest(pRequest As Demo.GenerateRequest) As %String [ Language = python ]
{
    params = {
        "max_tokens": pRequest.MaxNewTokens,
        "top_p": pRequest.TopP,        
    }
    self.Trace("OpenAI request - Model:" + self.ActualModel + " - max_tokens: " + str(pRequest.MaxNewTokens) + " - top_p: " + str(pRequest.TopP))

    response = self.Client.chat.completions.create(
        model=self.ActualModel,
        top_p=pRequest.TopP,
        max_tokens=pRequest.MaxNewTokens,
        messages=[
            {"role": "system", "content": self.ChatBotInstructions},
            {"role": "user", "content": pRequest.Prompt}
        ]
    )
    responseObj = {
        "model": response.model,
        "created": response.created,
        "response": response.choices[0].message.content,
        "finish_reason": response.choices[0].finish_reason,
        "completion_tokens": response.usage.completion_tokens,
        "prompt_tokens": response.usage.prompt_tokens,
        "total_tokens": response.usage.total_tokens
    }
    
    output = self.ToJson(responseObj)
    self.Trace("API Response: " + output)
    return output
}

Method GetAPIKey(pAPICredentialsID As %String, Output pSC As %Status) As %String [ Private ]
{
    Set tClassname = $CLASSNAME()
    Set pSC=##Class(Ens.Config.Credentials).GetCredentialsObj(.tCreds, tClassname , "Ens.Config.Credentials" ,pAPICredentialsID)

    If $$$ISOK((pSC)) {   
        Quit tCreds.Password
    }

    Quit ""
}

Method OnInit() As %Status
{
    #dim sc As %Status = $$$OK

    try {
        do ..PyInit()
    } catch ex {
        set sc = ex.AsStatus()
    }
    quit sc
}

Method PyInit() [ Language = python ]
{
    from openai import OpenAI
    from json import dumps

    self.ToJson = dumps
    self.ActualModel = self.CustomModel if self.CustomModel else self.Model
    self.Trace("OpenAI Model: "+ self.ActualModel)

    self.Client = OpenAI(
        api_key=self.GetAPIKey(self.APIKeyCredentials)
    )
}

ClassMethod LogInfo(Msg As %String)
{
    $$$LOGINFO(Msg)
}

ClassMethod Trace(Msg As %String)
{
    $$$TRACE(Msg)
}

}
