Class Demo.Service.StartPDFImportService Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tRequest = ##class(Ens.Request).%New()
    set tResponse = ##class(Ens.Response).%New()
    set tSC = ..SendRequestSync("Injection Process", tRequest, .tResponse)
    try {
        do ##class(Ens.Director).EnableConfigItem("Start PDF Import", 0, 1) 
    }
    Catch ex { }


    return $$$OK
}

}
