Class Demo.Operations.RAG.RAGOperation Extends Ens.BusinessOperation
{

Method OnRAG(pRequest As Demo.GenerateRequest, pResponse As Demo.Operations.RAG.RAGResponse) As %Status
{

    set tSc = $$$OK

    try {

      set tBuiltins = ##class(%SYS.Python).Builtins()

      set tList = tBuiltins.list()

      set tPrompt = pRequest.Prompt

      do tList.insert(0, tPrompt)

      set tVectors = ##class(Demo.Utils).GetEmbeddingPy(tList)

      set tVector = tVectors."__getitem__"(0)

      set tStatement = ##class(%SQL.Statement).%New()

      // Insert Code here for Task 6
      set tSql = ""

      set rList = ##class(%SQL.Statement).%ExecDirect(, tSql, tVector)

      set pResponse = ##class(Demo.Operations.RAG.RAGResponse).%New()

      set tRowCount = 0

      while rList.%Next(){

          set pResponse.DocIds = pResponse.DocIds_","_rList.%Get("ID")

          set tRowCount = tRowCount + 1

      }

      set pResponse.DocCount = tRowCount

    } catch ex {
        set tSc = ex.AsStatus()
    }

    return tSc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.GenerateRequest">
    <Method>OnRAG</Method>
  </MapItem>
</MapItems>
}

}
