Class Demo.GenerateRequest Extends (%Persistent, Ens.Request)
{

/// Input prompt.
Property Prompt As %String(MAXLEN = "");

/// Max number of tokens/words to predict.
Property MaxNewTokens As %Integer [ InitialExpression = 200 ];

/// Top K tokens to sample from.
Property TopK As %Integer [ InitialExpression = 40 ];

/// Top P threshold. Samples from tokens with the highest probability scores until threshold is reached.
Property TopP As %Float [ InitialExpression = 0.9 ];

Storage Default
{
<Data name="GenerateRequestDefaultData">
<Subscript>"GenerateRequest"</Subscript>
<Value name="1">
<Value>Prompt</Value>
</Value>
<Value name="2">
<Value>MaxNewTokens</Value>
</Value>
<Value name="3">
<Value>TopK</Value>
</Value>
<Value name="4">
<Value>TopP</Value>
</Value>
<Value name="5">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Demo.GenerateRequestD</DataLocation>
<DefaultData>GenerateRequestDefaultData</DefaultData>
<IdLocation>^Demo.GenerateRequestD</IdLocation>
<IndexLocation>^Demo.GenerateRequestI</IndexLocation>
<StreamLocation>^Demo.GenerateRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
