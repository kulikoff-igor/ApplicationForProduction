package controller;

import workingWithDatabase.WorkWithDatabaseApplications;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IT-1 on 25.02.14.
 */
public class RemoveApplication extends HttpServlet {
    private final WorkWithDatabaseApplications db = new WorkWithDatabaseApplications();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer idApplication = Integer.parseInt(request.getParameter("idApplication"));
        db.removeApplication(idApplication);
    }
}