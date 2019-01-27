package zoostore.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerQueries {
    private static final String URL = "jdbc:mysql://localhost:3306/zoostore_db?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String USERNAME = "zoo_root";
    private static final String PASSWORD = "nbuser";
    
    private Connection connection; // manages the connection
    private PreparedStatement selectCustomerByUserName;
    private PreparedStatement selectCustomerByPassword;
    private PreparedStatement insertNewCustomer;
    
    // Konstruktor
    public CustomerQueries() {
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            selectCustomerByUserName = connection.prepareStatement("SELECT * FROM customers WHERE UserName = ?");

            selectCustomerByPassword = connection.prepareStatement("SELECT * FROM customers WHERE Password = ?");

            insertNewCustomer = connection.prepareStatement("INSERT INTO customers " + " (UserName, Password, Email, CCNumber) " + "VALUES (?, ?, ?, ?)");
            
            
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
            System.exit(1);
        }
    }
    
    //Selects Customer with UserName for Login Form
    public List<Customer> getCustomerByUserName(String userName) {
        List<Customer> results = null;
        ResultSet resultSet = null;
        
        try {
            selectCustomerByUserName.setString(1, userName);
            
            // zapytanie resultSet
            resultSet = selectCustomerByUserName.executeQuery();
            
            results = new ArrayList<Customer>();
            
            while(resultSet.next()) {
                results.add(new Customer(
                        resultSet.getInt("customerID"),
                        resultSet.getString("userName"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("ccNumber"),
                        resultSet.getDouble("balance")));
            }
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        } finally {
            try {
                resultSet.close();
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
                close();
            }
        }
        
        return results;
    }

    public List<Customer> getCustomerByPassword(String password) {
        List<Customer> results = null;
        ResultSet resultSet = null;
        
        try {
            selectCustomerByPassword.setString(1, password);

            resultSet = selectCustomerByPassword.executeQuery();
            
            results = new ArrayList<Customer>();
            
            while (resultSet.next()) {
                results.add(new Customer(resultSet.getInt("customerID"),
                        resultSet.getString("userName"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("ccNumber"),
                        resultSet.getDouble("balance"))
                );
            }
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        } finally {
            try {
                resultSet.close();
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
                close();
            }
        }
        
        return results;
    }    
    
    // nowy użytkownik z rejeestracji
    public int addCustomer(String userName, String password, String email, String ccNumber) {
        int result = 0;

        try {
            insertNewCustomer.setString(1, userName);
            insertNewCustomer.setString(2, password);
            insertNewCustomer.setString(3, email);
            insertNewCustomer.setString(4, ccNumber);

            result = insertNewCustomer.executeUpdate();
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
            close();
        }
        
        return result;
    }
    
    // zamknięcie połączenia
    public void close() {
        try {
            connection.close();
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
    }    
}
