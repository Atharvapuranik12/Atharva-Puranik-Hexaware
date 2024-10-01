package com.AtharvaJava.abstractClasses;

public abstract class Vehicle {
    private String name;
    private double price;
    private boolean isRented;

    // here i defined paramaterised constructor ( Name and the Price)
    public Vehicle(String name, double price) {
        this.name = name;
        this.price = price;
        this.isRented = false;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public boolean isRented() {
        return isRented;
    }

    public void setRented(boolean rented) {
        this.isRented = rented;
    }

    // Abstract methods for the rentVehicle and the return Vehicle
    public abstract void rentVehicle();
    public abstract void returnVehicle();
}
