/*
 * The MIT License (MIT)
 * Copyright (c) 2020 Leif Lindbäck
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction,including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so,subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package se.kth.iv1351.jdbcintro;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

/**
 * A small program that illustrates how to write a simple JDBC program.
 */
public class SoundgoodDAO {

  public static void closeResultSet(ResultSet res) {

    if(res == null) {
      return;
    }

    try {
      res.close();
    } catch (SQLException e) {
      System.out.println(e);
    }
  }

  public static void exceptionHandler(Connection connection) {
    try {
      connection.rollback();

    } catch (SQLException s) {
      System.out.println("exceptionHandler error. connection now valid?");
    }
  }

  public static void terminateRental(Connection connection, int studentID, int instrumentID) {
    int currentStock = 0;
    String SQLstatement1 = "SELECT current_stock FROM instrument_stock INNER JOIN rented_instrument ON rented_instrument.instrument_stock_id = instrument_stock.id WHERE rented_instrument.id = " + instrumentID;
    String SQLstatement2 = "UPDATE rented_instrument SET lease_period_end=current_date WHERE id= " + instrumentID + " AND student_id = " + studentID;

    ResultSet res = null;
    ResultSet innerRes = null;
    try {
      ArrayList rentalIDs = getRentalIDs(connection, studentID, innerRes);

      if(!rentalIDs.contains(instrumentID)) {
        System.out.println("ID specified is not in list of rentals");
        return;
      }

      PreparedStatement stmt = connection.prepareStatement(SQLstatement1);
      res = stmt.executeQuery();
      if(res.next()) {
      }
      currentStock = res.getInt(1);

      String SQLstatement2point5 = "SELECT instrument_stock_id FROM rented_instrument WHERE student_id = " + studentID + " AND id = " + instrumentID;
      stmt = connection.prepareStatement(SQLstatement2point5);
      res = stmt.executeQuery();
      if(res.next()) {
      }
      int stockID = res.getInt(1);

      String SQLstatement3 = "UPDATE instrument_stock SET current_stock= " + (currentStock+1) + " WHERE id= " + stockID;// + " AND student_id = " + studentID;

      stmt = connection.prepareStatement(SQLstatement2);
      int updatedRows = stmt.executeUpdate();

      stmt = connection.prepareStatement(SQLstatement3);
      updatedRows = stmt.executeUpdate();

    } catch (SQLException sqle) {
      sqle.printStackTrace();
      exceptionHandler(connection);
    } finally {
      closeResultSet(res);
      closeResultSet(innerRes);
    }
  }

  public static void addRental(Connection connection, int studentID, int instrumentID) {
    int currentStock = 0;

    String SQLstatement0 = "SELECT current_stock FROM instrument_stock WHERE id = " + instrumentID;
    String SQLstatement1 = "SELECT current_stock FROM instrument_stock WHERE instrument_stock.id = " + instrumentID;
    String SQLstatement2 = "INSERT INTO rented_instrument(lease_period_start, lease_period_end, student_id, instrument_stock_id) SELECT current_date, current_date + interval '12 months', " + studentID + ", id FROM instrument_stock WHERE instrument_stock.id = " + instrumentID;

    ResultSet res = null;
    try {

      PreparedStatement stmt = connection.prepareStatement(SQLstatement0);
      res = stmt.executeQuery();
      if(res.next()) {
        // System.out.println("eyy");
      }
      currentStock = res.getInt(1);
      if(currentStock < 1) {
        System.out.println("No available units for this instrument ID");
        return;
      }

      stmt = connection.prepareStatement(SQLstatement1);
      res = stmt.executeQuery();
      if(res.next()) {
        // System.out.println("eyy");
      }
      currentStock = res.getInt(1);

      stmt = connection.prepareStatement(SQLstatement2);
      int updatedRows = stmt.executeUpdate();

      String SQLstatement3 = "UPDATE instrument_stock SET current_stock = " + (currentStock-1) + " WHERE id= " + instrumentID;
      stmt = connection.prepareStatement(SQLstatement3);
      updatedRows = stmt.executeUpdate();

      connection.commit();

      // System.out.println("Updated " + updatedRows + " rows");

    } catch (SQLException sqle) {
      exceptionHandler(connection);
    } finally {
      closeResultSet(res);
    }
  }

  public static ArrayList<Integer> getRentalIDs(Connection connection, int studentID, ResultSet rentals) throws SQLException {
    String tableName = "rented_instrument";
    ArrayList<Integer> rentalIDs = new ArrayList<Integer>();

    PreparedStatement stmt = connection.prepareStatement("SELECT id from " + tableName + " WHERE " + tableName + ".student_id = "
                           + studentID + " AND " + tableName + ".lease_period_end > current_date");
    rentals = stmt.executeQuery();

    while (rentals.next()) {
        rentalIDs.add(rentals.getInt(1));
    }
    return rentalIDs;
  }

  public static ArrayList<Integer> getStockIDs(Connection connection, ResultSet stocks) throws SQLException {
    String tableName = "instrument_stock";
    ArrayList<Integer> stockIDs = new ArrayList<Integer>();

    PreparedStatement stmt = connection.prepareStatement("SELECT id from " + tableName);
    stocks = stmt.executeQuery();

    while (stocks.next()) {
        stockIDs.add(stocks.getInt(1));
    }
    return stockIDs;
  }

  public static ArrayList<Integer> getStudentIDs(Connection connection) {
    String tableName = "student";
    ArrayList<Integer> studentIDs = new ArrayList<Integer>();
    ResultSet students = null;
    try {
      PreparedStatement stmt = connection.prepareStatement("SELECT id from " + tableName);
      students = stmt.executeQuery();

      while (students.next()) {
          studentIDs.add(students.getInt(1));
      }

      connection.commit();
      return studentIDs;

    } catch (SQLException sqle) {
      sqle.printStackTrace();
      exceptionHandler(connection);
    } finally {
      closeResultSet(students);
    }

    return null;
  }

  public static void listStock(Connection connection) {
    String tableName = "instrument_stock";
    ResultSet stock = null;
    try {
      PreparedStatement stmt = connection.prepareStatement("SELECT * from " + tableName + " WHERE " + tableName + ".current_stock > 0 ORDER BY(id)");
      stock = stmt.executeQuery();

      while (stock.next()) {
        System.out.println(
            "ID: " + stock.getInt(1) + ", Brand: " + stock.getString(2) + ", Type: " + stock.getString(3)
              + ", Instrument: " + stock.getString(4) + ", Price: " + stock.getFloat(5) + ", Available: " + stock.getInt(6));
      }
      connection.commit();
    } catch (SQLException sqle) {
      sqle.printStackTrace();
      exceptionHandler(connection);
    } finally {
      closeResultSet(stock);
    }
  }

  public static void listRented(Connection connection, int studentID) {

    String tableName = "instrument_stock";
    String SQLstatement = "SELECT i.id, i.lease_period_start AS started, i.lease_period_end AS terminates, stock.brand, stock.type, stock.instrument, stock.price FROM student AS s INNER JOIN rented_instrument AS i ON s.id = i.student_id INNER JOIN instrument_stock AS stock ON i.instrument_stock_id = stock.id WHERE i.lease_period_end > current_date AND s.id = " + studentID + "ORDER BY(id)";
    ResultSet rentals = null;
    try {
      PreparedStatement stmt = connection.prepareStatement(SQLstatement);
      rentals = stmt.executeQuery();

      while (rentals.next()) {
        System.out.println(
            "ID: " + rentals.getInt(1) + ", Started: " + rentals.getString(2) + ", Terminates: " + rentals.getString(3)
              + ", Brand: " + rentals.getString(4) + ", Type: " + rentals.getString(5) + ", Instrument: " + rentals.getString(6)
              + ", Price/month: " + rentals.getFloat(7));
      }
      connection.commit();
    } catch (SQLException sqle) {
      sqle.printStackTrace();
      exceptionHandler(connection);
    } finally {
      closeResultSet(rentals);
    }
  }
}
