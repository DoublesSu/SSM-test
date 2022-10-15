package com.atguigu.ssm_crud.pojo;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.Map;

/**
 * Description：通用返回Json数据的类
 *
 * @author Su
 * version 1.0
 * @date 2022/10/11 19:51
 */
public class Msg {

    //    状态码
    private int code;
    //    提示信息
    private String msg;
    //    用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<String, Object>();

    public Msg() {
    }

    public Msg(int code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.extend = extend;
    }

    public static Msg success(String msg) {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg(msg);
        return result;
    }

    public static Msg success() {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }

    public static Msg fail(String msg) {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg(msg);
        return result;
    }
    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", extend=" + extend +
                '}';
    }

    public int getCode() {
        return code;
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

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Msg add(String key, Object value) {
//        获取需要添加的key、value，并添加到当前对象内部
        this.getExtend().put(key, value);
        return this;
    }
}
