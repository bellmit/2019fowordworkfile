package qwe;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;

public class Test {
	public static void main(String[] args) {
		Connection conn=new Connection("82.211.13.98");
		try {
			conn.connect();
			boolean res=conn.authenticateWithPassword("oracle", "qwert123");
			System.out.println(res);
			InputStream in =null;
			String result="";
			Session session=conn.openSession();
			
			String a= "/oracle/app/oracle/product/12.2.0/bin/sqlldr src_layer/oracle@ICBCAMCDW control=/dw-data/AICS/control/AICS_REPAY_CONFIRM.ctl log=repay_confirm.log bad=repay_confirm.bad";
			System.out.println(a);
			
			session.execCommand("sh test1.sh");
			in=session.getStdout();
			//System.out.println(in);
			BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(in));
			StringBuffer stringBuffer= new StringBuffer();
			String s= new String();
			while((s=bufferedReader.readLine())!=null) {
				stringBuffer.append(s);
			}
			System.out.println(stringBuffer.toString());
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	
	

}
