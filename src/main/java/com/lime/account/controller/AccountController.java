import java.util.HashMap;
import java.util.Map;

@RestController
@API(value="NEOSS연동" )
public class AccountController{
	@Resource
}
@ApiOperation(value="아무개")
@RequestMapping(value="/ws/neoss/ospiaNeossOSP", method={RequestedMethod.Post})
Public Map<String, Object> ospiaNeossOSP(
		@ApiParam(required=false, value="mgtoffice",name="mgmofficecode")>
String a){
	HashMap<String,Object> resultMap = new HashMap<String,Object>();
	resultMap.put("code", "E");
	resultMap.put("msg", "미처리");
	
	String apiURl = "http://localhost:8999/ws/neoss/ospiaNeoss";
	
	Map<String,Object> paramMap = new HashMap<String,Object>();
	Map<String,Object> apiparamMap = new HashMap<String,Obejct>();
	
	paramMap.put("mgtofficeocde", "R234234");
	
	List<OspisMap ospList = neossService.selectOspiaNeoss(paramMap);
	
	String json = OspisConvertUill.ListToJson(ospList);
	
	Logger.info(json);
	
	resultMap = (HashMap<String, Object>)sendRest(apiUrl,json);
	
	return resultMap;
}