package sample;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * WebSocketデモ。
 *
 * @author DukeLab
 */
// Webソケットのサーバ側クラスであること表すアノテーション。
// 引数(wsdemo)はクライアントから接続時、使われるURIを表す。
@ServerEndpoint(value = "/wsdemo")
public class WebSocketDemo {

    private static Set<Session> ses = new CopyOnWriteArraySet<>();

    @OnOpen
    public void onOpen(Session session) {
        System.out.println("onOpen : " + session);
        ses.add(session);

    }

    @OnMessage
    public void onMessage(String msg) {
    	System.out.println(msg);


    for (Session ses : ses) {
            ses.getAsyncRemote().sendText(msg );
        }
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose : " + session);
        ses.remove(session);
    }


}
