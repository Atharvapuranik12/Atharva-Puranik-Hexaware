package com.AtharvaJava.user;

import com.AtharvaJava.abstractClasses.Vehicle;

public class User {
    private String userName;
    private Vehicle[] rentedVehicles; // Array is used to  store rented vehicles ( Truck or Bike or car)
    private int rentedCount; // its like a counter that keeps the track of the vehicles like how many vehicles have been rented and all 

    // parameterized Constructor ( 2 parameters 1- Name of the User or the buyer 2 - No. of vehicles (maximum)
    public User(String userName, int maxVehicles) {
        this.userName = userName;
        this.rentedVehicles = new Vehicle[maxVehicles];
        this.rentedCount = 0;
    }

    public String getUserName() {
        return userName;
    }

    public Vehicle[] getRentedVehicles() {
        return rentedVehicles;
    }

    public void rentVehicle(Vehicle vehicle) {
        if (!vehicle.isRented()) {
            if (rentedCount < rentedVehicles.length) {
                vehicle.rentVehicle();
                rentedVehicles[rentedCount] = vehicle;
                rentedCount++;
            } else {
                System.out.println("Cannot rent more vehicles. Maximum limit reached.");
            }
        } else {
            System.out.println(vehicle.getName() + " is already rented.");
        }
    }

    public void returnVehicle(Vehicle vehicle) {
        boolean found = false;
        for (int i = 0; i < rentedCount; i++) {
            if (rentedVehicles[i] == vehicle) {
                vehicle.returnVehicle();
                rentedVehicles[i] = null; 
                found = true;
                
                // Shift the remaining vehicles to maintain the array without gaps
                for (int j = i; j < rentedCount - 1; j++) {
                    rentedVehicles[j] = rentedVehicles[j + 1];
                }
                rentedVehicles[rentedCount - 1] = null; 
                rentedCount--; 
                // decreases the no. of count ( rented vehicle )
                break;
            }
        }

        if (!found) {
            System.out.println(vehicle.getName() + " was not rented by " + userName);
        }
    }

    public void displayRentedVehicles() {
        if (rentedCount == 0) {
            System.out.println(userName + " has no rented vehicles.");
        } else {
            System.out.println(userName + "'s rented vehicles:");
            for (int i = 0; i < rentedCount; i++) {
                System.out.println(rentedVehicles[i].getName() + " - $" + rentedVehicles[i].getPrice() + " per day");
            }
        }
    }
}
