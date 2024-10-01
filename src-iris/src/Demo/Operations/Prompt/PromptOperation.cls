Class Demo.Operations.Prompt.PromptOperation Extends Ens.BusinessOperation
{

Method OnPrompt(pRequest As Demo.Operations.Prompt.PromptRequest, pResponse As Demo.Operations.Prompt.PromptResponse) As %Status
{

    set tSc = $$$OK

    try {

      set tDoclist = $LISTFROMSTRING(pRequest.DocIds,",")

      set pResponse = ##class(Demo.Operations.Prompt.PromptResponse).%New()

      set tContextString = "Context:"

      for i=2:1:$LISTLENGTH(tDoclist) {

          set tDoc = ##class(Demo.RecordEmbeddings).%OpenId($LIST(tDoclist, i))

          set tContextString = tContextString _ " " _ tDoc.Text

      }

      set tPromptString = "Prompt: " _ pRequest.Prompt

      set tPrompt = tContextString _ " " _ tPromptString

      set pResponse.Prompt = tPrompt

    } catch tEx {
        set tSc = tEx.AsStatus()
    }

    return tSc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.Operations.Prompt.PromptRequest">
    <Method>OnPrompt</Method>
  </MapItem>
</MapItems>
}

}
