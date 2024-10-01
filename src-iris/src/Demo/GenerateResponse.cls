Class Demo.GenerateResponse Extends (%Persistent, Ens.Response, %JSON.Adaptor)
{

Property Model As %String(MAXLEN = 200);

Property Response As %String(MAXLEN = "");

Storage Default
{
<Data name="GenerateResponseDefaultData">
<Subscript>"GenerateResponse"</Subscript>
<Value name="1">
<Value>Model</Value>
</Value>
<Value name="2">
<Value>Response</Value>
</Value>
<Value name="3">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Demo.GenerateResponseD</DataLocation>
<DefaultData>GenerateResponseDefaultData</DefaultData>
<IdLocation>^Demo.GenerateResponseD</IdLocation>
<IndexLocation>^Demo.GenerateResponseI</IndexLocation>
<StreamLocation>^Demo.GenerateResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
