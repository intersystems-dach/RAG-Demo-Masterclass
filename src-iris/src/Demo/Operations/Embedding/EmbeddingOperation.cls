Class Demo.Operations.Embedding.EmbeddingOperation Extends Ens.BusinessOperation
{

Property ChunkSize As %Integer;

Property ChunkOverlap As %Integer;

Parameter SETTINGS = "ChunkSize:Text Chunking,ChunkOverlap:Text Chunking";

Method OnGetEmbeddings(pRequest As Demo.Operations.Embedding.EmbeddingRequest, pResponse As Demo.Operations.Embedding.EmbeddingResponse) As %Status
{

    set tSc = $$$OK

    try{

        set tId = pRequest.Pdf

        set tPdf = ##class(Demo.PDFRecord).%OpenId(tId)

        set tChunks = ##class(Demo.Utils).GetChunks(tPdf.Text, ..ChunkSize, ..ChunkOverlap)

        set tVectors = ##class(Demo.Utils).GetEmbeddingPy(tChunks)

        for i=0:1:(tVectors."__len__"()-1) {
            set tVector = tVectors."__getitem__"(i)
            set tChunk = tChunks."__getitem__"(i)
            set tRecordId = i
            
            // Insert Code for Task 4 here
            // &sql()
            &sql()
        }

        set pResponse = ##class(Demo.Operations.Embedding.EmbeddingResponse).%New()

        set pResponse.NumberEmbeddings = tVectors."__len__"()

    }
    catch tEx {
        set tSc = tEx.AsStatus()
    }
    
    return tSc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.Operations.Embedding.EmbeddingRequest">
    <Method>OnGetEmbeddings</Method>
  </MapItem>
</MapItems>
}

}
