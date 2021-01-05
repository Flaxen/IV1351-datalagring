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

public class Controller {

  SoundgoodDAO db = new SoundgoodDAO();

  public void login() {
    System.out.println("provide a student ID");
  }
  public int login(int id, Connection connection) {
    if(db.getStudentIDs(connection).contains(id)) {
      return id;
    } else {
      System.out.println("no student with such ID");
      return 0;
    }

  }

  public void listAvailable(Connection connection, String instrument) {
    db.listStock(connection, instrument);
  }
  public void listAvailable(Connection connection) {
    db.listStock(connection);
  }

  public void listRentals(Connection connection, int studentID) {
    if(studentID == 0) {
      System.out.println("Not logged in");
    } else {
      db.listRented(connection, studentID);
    }
  }

  public void rent() {
    System.out.println("Please specify an instrument stock ID");
  }
  public void rent(Connection connection, int studentID, int instrumentID) {
    ResultSet res = null;
    try {
      ArrayList stockIDs = db.getStockIDs(connection, res);
      ArrayList rentalIDs = db.getRentalIDs(connection, studentID, res);


      if(rentalIDs.size() >= 2) {
        System.out.println("You already have a maximum number of rentals");
      } else if(stockIDs.contains(instrumentID)) {
        db.addRental(connection, studentID, instrumentID);
      } else {
        System.out.println("Specified ID not in stock list");
      }
    } catch (SQLException e) {
      db.exceptionHandler(connection);
      return;
    } finally {
      db.closeResultSet(res);
    }
  }

  public void terminate() {
    System.out.println("Please specify a rental ID");
  }
  public void terminate(Connection connection, int studentID, int instrumentID) {
    ResultSet innerRes = null;
    try {
      ArrayList rentalIDs = db.getRentalIDs(connection, studentID, innerRes);
      if(rentalIDs.contains(instrumentID)) {
        db.terminateRental(connection, studentID, instrumentID);
      } else {
        System.out.println("ID specified is not in list of rentals");
      }
    } catch (SQLException e) {
      db.exceptionHandler(connection);
      return;
    }

  }

}
