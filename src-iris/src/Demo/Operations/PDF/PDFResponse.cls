Class Demo.Operations.PDF.PDFResponse Extends (%Persistent, Ens.Response)
{

Property NextKeyIndex As %Integer;

Property PdfId As %Integer;

Property PdfText As %String(MAXLEN = "");

Storage Default
{
<Data name="PDFResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NextKeyIndex</Value>
</Value>
<Value name="3">
<Value>PdfId</Value>
</Value>
<Value name="4">
<Value>PdfText</Value>
</Value>
</Data>
<DataLocation>^Demo.Operation98A3.PDFResponseD</DataLocation>
<DefaultData>PDFResponseDefaultData</DefaultData>
<IdLocation>^Demo.Operation98A3.PDFResponseD</IdLocation>
<IndexLocation>^Demo.Operation98A3.PDFResponseI</IndexLocation>
<StreamLocation>^Demo.Operation98A3.PDFResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
