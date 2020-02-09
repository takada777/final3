package sample;

public class Test {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		MailSend mail = new MailSend();
		String mailadd[] = new String[2];
		mailadd[0] = "tanimoto077@gmail.com";
		mailadd[1] = "name.namekoningen@gmail.com";
		mail.mailBccSend(mailadd, "test", "aaaa");
	}

}
