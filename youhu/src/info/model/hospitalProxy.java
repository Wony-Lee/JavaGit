package info.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class hospitalProxy {
	public String getData(String keyword) {
		String key="667259714363686c34387371515879";
		String type="xml";
		String service="SeoulAnimalHospital";
		String url="http://openapi.seoul.go.kr:8088/"+key+"/xml/SeoulAnimalHospital/1/5/?START_INDEX=1&END_INDEX=10";

		int start_index=1;
		int end_index=10;
		
		String text = null;
        try {
            text = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("예외ㅗ:",e);
        }
        
        String queryStr="?query="+text;

        String apiURL = "?query="+text; 
        
        Map<String, String> requestHeaders = new HashMap<>(); 
        String responseBody = get(url+apiURL,requestHeaders);
        System.out.println(responseBody);
        return responseBody;
	}
	
	private String get(String apiURL, Map<String, String> requestHeaders) {
	        HttpURLConnection con = connect(apiURL);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }
	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { 
	                return readBody(con.getInputStream());
	            } else {
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API ��û�� ���� ����", e);
	        } finally {
	            con.disconnect();
	        }
	    }
	
private static HttpURLConnection connect(String apiUrl){
    try {
        URL url = new URL(apiUrl);
        return (HttpURLConnection)url.openConnection();
    } catch (MalformedURLException e) {
        throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
    } catch (IOException e) {
        throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
    }
}

private static String readBody(InputStream body){
    
	try {
		InputStreamReader streamReader = new InputStreamReader(body,"UTF-8");
		BufferedReader lineReader = new BufferedReader(streamReader);
        StringBuilder responseBody = new StringBuilder();
        String line;
        while ((line = lineReader.readLine()) != null) {
            responseBody.append(line);
        }
        lineReader.close();
        streamReader.close();
        return responseBody.toString();
    } catch (IOException e) {
        throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
    }
	
}

}
