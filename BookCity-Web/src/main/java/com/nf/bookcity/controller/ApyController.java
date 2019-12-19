package com.nf.bookcity.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;

import com.nf.bookcity.entity.Cart;
import com.nf.bookcity.entity.Customer;
import com.nf.bookcity.entity.OrderDetail;
import com.nf.bookcity.entity.OrderMaster;
import com.nf.bookcity.util.OrderUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@Controller
public class ApyController {
    private final String APP_ID = "2016101500691953";
    private final String APP_PRIVATE_KEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCDYiAiRm9xRz+PEOB2yC18J+h+fDL0Oe3qEiJFEqT7Ccr/pjBzKujaRH/Vj4gI4KQ2yz2yeALu925OmXI+itdFLkfYCpCkeaoO5njAISIVKvunobnlmw3SXJ2XJqMyQI0vDaqlAUbBVgKVP8QlkMdI/0C5KJophSdqT91Fg1SKvzGjnnkpboCg6E4MqhHwJ1ppNjRtWiZvfnmfh4GqtXwlE0veE+DSu77ze06MNkPwho2U+v4bVqpQKHn9hDDXIlN9syzduT7XZiDKVg6ZJB105YTtOJtgJnx752jYGOpG58vaQVmiGbE4J3IpEA9pncU+ozO0fbAfvkrVzwVE/rvnAgMBAAECggEAYntaRPbxMENM5EutRbxVQ/ySLMWiWClYKh2/rHEGU9qKXMlRBfMDKiEwhX+aY7Unwp7kN3P4FvJHsAkbdsASDxxa5Bk/RNqh25tspe/wIVff3U7ADtkEKkwcIKHosJFsgvnGkPr8840qUH/E4re8ef5DoMdLj5Xs7qbA4QtJgtord0N5NE5ROd85EmWBuH7X+kOQn1diT5DJ4rOvVzx+wxO5g5wNj/+yw2ayba2JSOvVr8nr8RP1teeqHdr+EVWQDQvE0iUml6ocv0Ez/3lJJbqz1vt5rRnYjeciPZtUqUM+ieQH13oVdEFFRPxO3BHbuLQbhFXmg/ocsORzvoeJaQKBgQDNo0dVTNN14dVOWD7Qxa8pXbV9IgaseIwBVMGWhU+sehWWoRQ0Gp5C9VAixnnidKYPoYIpFgSPz8iu7g/PDPuJ0v6bDCR8s2nEPrSrdelBFjDobvQxLM7RaGjb1cOpmwQ48JisqxbEPK+75bd/lRPi0PwVGkQpc3pg6KElD4wyywKBgQCjj14AM+KexPiQD+SuFciHtjaqXaIKz2IbY7iqjxY5z9I9APp6bPk8i8fOBrg7nfEferBehf2pk1dLK3GBfNcTRulxbnmGqTN9FQzHPGdbIdhAvx5ypm3SprpWjwWbx+j5RTTKW80y2iy7BQGxJ2M+mzMV/cGiAvCZUdaBvYVL1QKBgEzGLRe3uytDyXOalrkzVRZImj3BumQiDYNhtXURCJIIco7uTLC3T2cIV4bkOxVFH8quLf5Q7hsTJIXK87QF0NPAJraUbfrwsQhHsQRi3VcjhdcBtcG2TPD53kxVHtvvuD/Z8+ZjafiR/7pTJZNIgUgpZjQqvlALgSE1ORSxHVLJAoGATqqo+o36BIUWTCvowDYn8eYY2s4YHvzp4eSPsDEL7phfNQogbvu00IMmgZhHyhzIGWzoIT5u572/MZ9eg3oo89Oaef05pCQDaLjUIYuS5okbuuBxY5FapwOcAf/eIbQAAMxhfKa0xi2bcAQTcUJRgI4i/wPCuwqQ8B0lf9dIolUCgYAQKAcHY0XTWqjQjuMDy8E5XTotmFHfk1RPrXrWLPiOF+lL+UOxjbvPCapoiHWitT8kkyEaGuSwU7KgyrBxarQ3+H3WiDOs7sVd6HZ3bmECaiGGaftb4XzNge6uVr37DVvcnvHE6xMxeqycR0hEfyfQzkpq0J/1B0S2po5C8lop7w==";
    private final String CHARSET = "UTF-8";
    //这个是支付宝公匙，不是应用公匙！！！
    private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlNvB7Gw1tyH47bB9983HITKX8fGwYh1ffPbN7S7OyW8lC0a7fQ6GwfnRfWTyL+6Wit21S1TPYWvnMqfNbNY49SRKmBq4L9UlWexAdVs4aa7gLNA02fgMlgaZkTL9cPpvejZ4p9+l5lGyvGh77SafbLnqcF6CgyFAgYgD8+HKsCGujFFZ1IwBBLwc5PlB2WpoW9RjATghTm7vdvpEUJuQiNS01eN9E174S9+ibNOLAXvuC+KJxSk18UJNoEhla7Ks4Pz3p7O1ED14nMQ9jv/ZJ9Ck6oRnk5yARHuhA90sVEX9BQVrnopz+zHqxByyhkcIi7hWqW3d6nIJj/xNGYR2FQIDAQAB";
    //这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
    private final String GATEWAY_URL ="https://openapi.alipaydev.com/gateway.do";
    private final String FORMAT = "JSON";
    //签名方式
    private final String SIGN_TYPE = "RSA2";
    //支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
    private final String NOTIFY_URL = "http://localhost:8080/notifyUrl";
    //支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
    private final String RETURN_URL = "http://localhost:8080/returnUrl";

    @RequestMapping("/alipay")
    public void alipay(@RequestParam(value = "total",required = false)String total,
                       HttpServletResponse httpResponse,
                       HttpServletRequest req) throws IOException {
        //实例化客户端,填入所需参数
        AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        //在公共参数中设置回跳和通知地址
        request.setReturnUrl(RETURN_URL);
        request.setNotifyUrl(NOTIFY_URL);
        //根据订单编号,查询订单相关信息
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String orderSn = OrderUtil.getOrderId();
        String bookName = "";
        HttpSession session = req.getSession();
        List<Cart> carts = (List<Cart>) session.getAttribute("confirmCart");
        for (Cart cart : carts) {
            bookName += cart.getCartBookName() + ";";
        }
        String out_trade_no = orderSn;
        //付款金额，必填
        String total_amount = total;
        //订单名称，必填
        String subject = bookName;
        //商品描述，可空
        String body = "";
        request.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String form = "";
        try {
            form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        httpResponse.setContentType("text/html;charset=" + CHARSET);
        httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
        httpResponse.getWriter().close();

        session.setAttribute("orderTotal",total);
        session.setAttribute("orderSn",orderSn);
    }

    @RequestMapping(value = "/returnUrl", method = RequestMethod.GET)
    public String returnUrl(HttpServletRequest request, HttpServletResponse response)
            throws IOException, AlipayApiException {
        System.out.println("=================================同步回调=====================================");
        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = (Map<String, String[]>) request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
/*
            valueStr = new String(valueStr.getBytes("utf-8"), "utf-8");
*/
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        System.out.println(params);//查看参数都有哪些
       boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
//验证签名通过
        System.out.println("signVerified = " + signVerified);
        if (signVerified) {
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            System.out.println("商户订单号=" + out_trade_no);
            System.out.println("支付宝交易号=" + trade_no);
            System.out.println("付款金额=" + total_amount);

            //支付成功，修复支付状态
            return "redirect:/customer/success";//跳转付款成功页面
        } else {
            return "";//跳转付款失败页面
        }
    }

}
