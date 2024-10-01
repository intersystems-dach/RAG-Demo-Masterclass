Class Demo.DemoProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.DemoProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="PDF Operation" Category="" ClassName="Demo.Operations.PDF.PDFOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Bucket">ragbucketdach</Setting>
    <Setting Target="Host" Name="Key">Abble.pdf,Logystics_Eng.pdf</Setting>
  </Item>
  <Item Name="Embedding Operation" Category="" ClassName="Demo.Operations.Embedding.EmbeddingOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ChunkOverlap">100</Setting>
    <Setting Target="Host" Name="ChunkSize">512</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
  </Item>
  <Item Name="RAG Operation" Category="" ClassName="Demo.Operations.RAG.RAGOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
  </Item>
  <Item Name="Injection Process" Category="" ClassName="Demo.Processes.InjectionProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OpenAI Operation" Category="" ClassName="Demo.Operations.OpenAI.APIOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Model">gpt-4o</Setting>
    <Setting Target="Host" Name="ChatBotInstructions">You are a helpful assistant.</Setting>
    <Setting Target="Host" Name="APIKeyCredentials">OpenAIKey</Setting>
  </Item>
  <Item Name="Prompt Operation" Category="" ClassName="Demo.Operations.Prompt.PromptOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Streamlit Service" Category="" ClassName="Demo.Service.StreamlitService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">LLM Process</Setting>
  </Item>
  <Item Name="Start PDF Import" Category="" ClassName="Demo.Service.StartPDFImportService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">100000</Setting>
  </Item>
  <Item Name="LLM Process" Category="" ClassName="Demo.Processes.LLMProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
