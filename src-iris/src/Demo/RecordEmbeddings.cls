Class Demo.RecordEmbeddings Extends %Persistent
{

Property DataSourceId As %Integer;

Property SourceId As %Integer;

Property Text As %String(MAXLEN = 1024);

// Insert Code for Task 3 here



Index idxDataSourceId On DataSourceId;

Storage Default
{
<Data name="RecordEmbeddingsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DataSourceId</Value>
</Value>
<Value name="3">
<Value>SourceId</Value>
</Value>
<Value name="4">
<Value>Embedding</Value>
</Value>
<Value name="5">
<Value>Text</Value>
</Value>
</Data>
<DataLocation>^Demo.RecordEmbeddingsD</DataLocation>
<DefaultData>RecordEmbeddingsDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^Demo.RecordEmbeddingsD</IdLocation>
<IndexLocation>^Demo.RecordEmbeddingsI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DataSourceId">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Embedding">
<AverageFieldSize>8516</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="SourceId">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Text">
<AverageFieldSize>121</AverageFieldSize>
<OutlierSelectivity>.999999:"für die Kraft der Liebe, die alle Widrigkeiten übersteht und im Laufe der Zeit immer tiefer und"_$c(13,10)_"bedeutungsvoller wird."</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="idxDataSourceId">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Demo.RecordEmbeddingsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
