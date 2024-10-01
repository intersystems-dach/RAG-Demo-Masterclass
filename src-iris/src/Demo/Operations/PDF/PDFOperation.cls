Class Demo.Operations.PDF.PDFOperation Extends Ens.BusinessOperation
{

Property Bucket As %String(MAXLEN = 50);

Property Key As %String(MAXLEN = 1024);

Parameter SETTINGS = "Bucket:S3,Key:S3";

Method OnGetPDFFromS3(pRequest As Demo.Operations.PDF.PDFRequest, Output pResponse As Demo.Operations.PDF.PDFResponse) As %Status
{

    set tSc = $$$OK

    try {
        set tKeyIndex = pRequest.KeyIndex

        set tKey = $ZSTRIP($PIECE(..Key, ",", tKeyIndex), "<>W")

        $$$TRACE("Key:"_tKey)

        set tPdf = ..GetPDFFromS3(tKey)

        set tPdfRecord = ##class(Demo.PDFRecord).%New()

        set tPdfRecord.Text = tPdf

        $$$ThrowOnError(tPdfRecord.%Save()) 

        set tPdfId = tPdfRecord.%Id()


        set pResponse = ##class(Demo.Operations.PDF.PDFResponse).%New()

        set pResponse.PdfId = tPdfId

        set pResponse.PdfText = tPdf

        set tNextKey = $ZSTRIP($PIECE(..Key, ",", tKeyIndex + 1), "<>W")

        if (tNextKey '= "") {
            set pResponse.NextKeyIndex = tKeyIndex + 1
        } else {
            set pResponse.NextKeyIndex = 0
        }     
        
    } catch tEx {
        set tSc = tEx.AsStatus()
    }

    return tSc
}

Method GetPDFFromS3(pKey As %String) As %SYS.Python [ Language = python ]
{
    from io import BytesIO
    from PyPDF2 import PdfReader
    import boto3
    from botocore import UNSIGNED
    from botocore.client import Config
    from botocore.exceptions import ClientError

    if(self.Bucket != "" and self.Key != ""):

        # Initialize a session using Amazon S3 with unsigned configuration
        s3 = boto3.client('s3', config=Config(signature_version=UNSIGNED))

        response = s3.get_object(Bucket=self.Bucket,Key=pKey)

        reader = PdfReader(BytesIO(response['Body'].read()))

        text = ""

        for page in reader.pages:
            text += page.extract_text()

        return text
    else:
        return ""
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.Operations.PDF.PDFRequest">
    <Method>OnGetPDFFromS3</Method>
  </MapItem>
</MapItems>
}

}
