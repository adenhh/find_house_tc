package com.example.find_house.base;

public class ApiResponse {
    private int code;
    private String message;
    private Object data;

    public ApiResponse(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public enum Status {
        SUCCESS(200, "success"),
        SYSTEM_ERROR(500, "system error");


        private  int code;

        public int getCode() {
            return code;
        }
        Status(int code, String msg) {
            this.code = code;
            this.msg =msg;
        }
        public void setCode(int code) {
            this.code = code;
        }

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        private String msg;


    }

    public static ApiResponse toSuccess(Object data) {
        return new ApiResponse(Status.SUCCESS.code, Status.SUCCESS.msg, data);
    }

    public static ApiResponse toFailed(Status status) {
        return new ApiResponse(status.getCode(), status.getMsg(), null);
    }
}
