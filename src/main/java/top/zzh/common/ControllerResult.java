package top.zzh.common;

public class ControllerResult {
	
	public static final String SUCCESS = "success";
	public static final String FAIL = "fail";
	
	private String result; // 控制器执行的结果：success, fail, error
	private String message; // 提示信息
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public static ControllerResult getSuccessResult(String messgae) {
		ControllerResult controllerResult = new ControllerResult();
		controllerResult.setResult(SUCCESS);
		controllerResult.setMessage(messgae);
		return controllerResult;
	}
	
	public static ControllerResult getFailResult(String messgae) {
		ControllerResult controllerResult = new ControllerResult();
		controllerResult.setResult(FAIL);
		controllerResult.setMessage(messgae);
		return controllerResult;
	}

}
