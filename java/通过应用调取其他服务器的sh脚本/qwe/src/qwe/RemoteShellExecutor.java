package qwe;

import java.io.IOException;

import ch.ethz.ssh2.ChannelCondition;
import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;

public class RemoteShellExecutor {

	private Connection conn;
	private String ip;
	private String username;
	private String password;
	private static final int TIME_OUT = 0;// ��ʾ����ʱ

	/**
	 * ���캯��
	 *
	 * @param ip       Զ��ip
	 * @param username Զ�̻����û���
	 * @param password Զ�̻�������
	 */
	public RemoteShellExecutor(String ip, String username, String password) {
		this.ip = ip;
		this.username = username;
		this.password = password;
	}

	/**
	 * ��¼
	 *
	 * @return
	 * @throws IOException
	 */
	private boolean login() throws IOException {
		conn = new Connection(ip);
		conn.connect();
		return conn.authenticateWithPassword(username, password);
	}

	/**
	 * ִ�нű�
	 *
	 * @param shell
	 * @return
	 * @throws Exception
	 */
	public int exec(String shell) throws Exception {
		int ret = -1;
		try {
			if (login()) {
				Session session = conn.openSession();
				session.execCommand(shell);
				session.waitForCondition(ChannelCondition.EXIT_STATUS, TIME_OUT);
				ret = session.getExitStatus();
			} else {
				throw new Exception("��¼Զ�̻���ʧ��" + ip); // �Զ����쳣�� ʵ����
			}
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		return ret;
	}

	public static void main(String[] args) {
		try {
			RemoteShellExecutor executor = new RemoteShellExecutor("82.211.15.106", "oracle", "qwert789");
			//executor.exec("/Users/zhangzhiqiang/Documents/my_projects/bdexample/springboot-mybatis-demo/apidoc.sh");
			executor.exec("uname -s -r -v");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
