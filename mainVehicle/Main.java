package com.AtharvaJava.mainVehicle;

import com.AtharvaJava.concreteClasses.Car;
import com.AtharvaJava.concreteClasses.Bike;
import com.AtharvaJava.concreteClasses.Truck;
import com.AtharvaJava.user.User;
import com.AtharvaJava.abstractClasses.Vehicle;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Create vehicles ... 🚗🚗🚗🚗
        Vehicle car1 = new Car("Toyota", 50);
        Vehicle bike1 = new Bike("Yamaha", 20);
        Vehicle truck1 = new Truck("Volvo", 100);
        User user = new User("John", 3); 

        while (true) {
            System.out.println("\nVehicle Rental System");
            System.out.println("1. Rent a Vehicle");
            System.out.println("2. Return a Vehicle");
            System.out.println("3. View Rented Vehicles");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            int choice = sc.nextInt();

            switch (choice) {
                case 1 -> {
                    System.out.println("Available Vehicles:");
                    System.out.println("1. Car - " + car1.getName() + " ($" + car1.getPrice() + " per day)");
                    System.out.println("2. Bike - " + bike1.getName() + " ($" + bike1.getPrice() + " per day)");
                    System.out.println("3. Truck - " + truck1.getName() + " ($" + truck1.getPrice() + " per day)");
                    System.out.print("Choose a vehicle to rent (1-3): ");
                    int vehicleChoice = sc.nextInt();
                    switch (vehicleChoice) {
                        case 1 -> user.rentVehicle(car1);
                        case 2 -> user.rentVehicle(bike1);
                        case 3 -> user.rentVehicle(truck1);
                        default -> System.out.println("Invalid choice.");
                    }
                }
                case 2 -> {
                    user.displayRentedVehicles();
                    if (user.getRentedVehicles().length > 0) {
                        System.out.print("Enter the vehicle name to return: ");
                        sc.nextLine(); 
                        String vehicleToReturn = sc.nextLine();
                        if (vehicleToReturn.equalsIgnoreCase(car1.getName())) {
                            user.returnVehicle(car1);
                        } else if (vehicleToReturn.equalsIgnoreCase(bike1.getName())) {
                            user.returnVehicle(bike1);
                        } else if (vehicleToReturn.equalsIgnoreCase(truck1.getName())) {
                            user.returnVehicle(truck1);
                        } else {
                            System.out.println("Vehicle not found.");
                        }
                    } else {
                        System.out.println("No vehicles to return.");
                    }
                }
                case 3 -> user.displayRentedVehicles();
                case 4 -> {
                    System.out.println("Exiting system...");
                    sc.close();
                    return;
                }
                default -> System.out.println("Invalid choice.");
            }
        }
    }
}
