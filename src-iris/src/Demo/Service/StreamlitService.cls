Class Demo.Service.StreamlitService Extends Ens.BusinessService
{

/// Configuration item(s) to which to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// Max number of tokens/words to predict.
Property MaxNewTokens As %Integer [ InitialExpression = 200 ];

/// Top K tokens to sample from.
Property TopK As %Integer [ InitialExpression = 40 ];

/// Top P threshold. Samples from tokens with the highest probability scores until threshold is reached.
Property TopP As %Float [ InitialExpression = 0.9 ];

Parameter SETTINGS = "TargetConfigName:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},MaxNewTokens:Request,TopK:Request,TopP:Request";

Method Ask(pPrompt As %String) As %String
{

    set tRequest = ##class(Demo.GenerateRequest).%New()
    set tRequest.Prompt = pPrompt
    set tRequest.MaxNewTokens = ..MaxNewTokens
    set tRequest.TopK = ..TopK
    set tRequest.TopP = ..TopP

    set tSC = ..SendRequestSync(..TargetConfigName, tRequest, .tResponse)

    return tResponse.Response
}

/// Return an array of connections for drawing lines on the config diagram
ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
    Do ##super(.pArray,pItem)
    If pItem.GetModifiedSetting("TargetConfigName",.tValue) {
        For i=1:1:$L(tValue,",") { 
            Set tOne=$ZStrip($P(tValue,",",i),"<>W")  
            Continue:""=tOne  Set pArray(tOne)="" }
    }
}

}
