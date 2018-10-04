package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class LoadDBUtils
 *
 */
@WebListener
public class LoadDBUtils implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public LoadDBUtils() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         try {
			Class.forName("db.DBUtils");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }
	
}