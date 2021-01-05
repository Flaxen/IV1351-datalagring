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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class view {

  private static Connection createConnection() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");
    Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood",
      "postgres", "example");
    connection.setAutoCommit(false);
    return connection;
  }



  public static void main(String[] args) {
    int currentUser = 0;

    try (Connection connection = createConnection()) {

      BufferedReader reader =  new BufferedReader(new InputStreamReader(System.in));

      System.out.println("Connected to SGRSa1");
      String input;
      loop: while(true) {
        System.out.print("soundgood rental system a1.4356$ ");
        input = reader.readLine();
        String[] ia = input.split(" ");

        Controller controller = new Controller();

        switch(ia[0]) {
          case "exit":
            break loop;
          case "commands":
            System.out.println("Commands: exit, login, list_available, list_rentals, rent, terminate");
            break;
          case "login":
            if (ia.length > 1) {
              currentUser = controller.login(Integer.parseInt(ia[1]), connection);
            } else {
              controller.login();
            }
            break;
          case "list_available":
            if(ia.length > 1) {
              controller.listAvailable(connection, ia[1]);
            } else {
              controller.listAvailable(connection);
            }
            break;
          case "list_rentals":
            controller.listRentals(connection, currentUser);
            break;
          case "rent":
            if (ia.length > 1) {
              controller.rent(connection, currentUser, Integer.parseInt(ia[1]));
            } else {
              controller.rent();
            }
            break;
          case "terminate":
            if (ia.length > 1) {
              controller.terminate(connection, currentUser, Integer.parseInt(ia[1]));
            } else {
              controller.terminate();
            }
            break;
          default:
            System.out.println("Invalid command, type 'commands' to list all commands");
            break;
        }

      }
      connection.close();

    } catch (SQLException | ClassNotFoundException | IOException | NumberFormatException exc) {
      exc.printStackTrace();
    }

    System.out.println("closing soundgood renting system a1.4356..");
  }
}
