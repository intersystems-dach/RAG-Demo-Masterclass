Class Demo.Operations.RAG.RAGResponse Extends (%Persistent, Ens.Response)
{

Property DocIds As %String;

Property DocCount As %Integer;

Storage Default
{
<Data name="RAGResponseDefaultData">
<Subscript>"RAGResponse"</Subscript>
<Value name="1">
<Value>DocIds</Value>
</Value>
<Value name="2">
<Value>SQLCode</Value>
</Value>
<Value name="3">
<Value>DocCount</Value>
</Value>
<Value name="4">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Demo.OperationC8C0.RAGResponseD</DataLocation>
<DefaultData>RAGResponseDefaultData</DefaultData>
<IdLocation>^Demo.OperationC8C0.RAGResponseD</IdLocation>
<IndexLocation>^Demo.OperationC8C0.RAGResponseI</IndexLocation>
<StreamLocation>^Demo.OperationC8C0.RAGResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
