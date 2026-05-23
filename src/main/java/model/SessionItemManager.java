package model;

import java.util.*;
import javax.servlet.http.HttpSession;

public class SessionItemManager {
    private static SessionItemManager instance;
    private static final String SESSION_KEY = "viewedItems";

    private SessionItemManager() {}

    public static SessionItemManager getInstance() {
        if (instance == null) {
            synchronized (SessionItemManager.class) {
                if (instance == null) {
                    instance = new SessionItemManager();
                }
            }
        }
        return instance;
    }

    @SuppressWarnings("unchecked")
    public List<ViewedItem> getViewedItems(HttpSession session) {
        Object list = session.getAttribute(SESSION_KEY);
        if (list == null) {
            List<ViewedItem> newList = new ArrayList<>();
            session.setAttribute(SESSION_KEY, newList);
            return newList;
        }
        return (List<ViewedItem>) list;
    }

    public void addItem(HttpSession session, ViewedItem item) {
        List<ViewedItem> items = getViewedItems(session);
        items.add(item);
        session.setAttribute(SESSION_KEY, items);
    }
}

