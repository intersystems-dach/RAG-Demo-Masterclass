Class Demo.Operations.Prompt.PromptResponse Extends (%Persistent, Ens.Response)
{

Property Prompt As %String(MAXLEN = "");

Storage Default
{
<Data name="PromptResponseDefaultData">
<Subscript>"PromptResponse"</Subscript>
<Value name="1">
<Value>Prompt</Value>
</Value>
<Value name="2">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Demo.Operat80EF.PromptResponseD</DataLocation>
<DefaultData>PromptResponseDefaultData</DefaultData>
<IdLocation>^Demo.Operat80EF.PromptResponseD</IdLocation>
<IndexLocation>^Demo.Operat80EF.PromptResponseI</IndexLocation>
<StreamLocation>^Demo.Operat80EF.PromptResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
