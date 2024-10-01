package com.AtharvaJava.concreteClasses;

import com.AtharvaJava.abstractClasses.Vehicle;

public class Truck extends Vehicle {
    public Truck(String name, double price) {
        super(name, price);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            System.out.println(getName() + " truck has been rented for $" + getPrice() + " per day.");
            setRented(true);
        } else {
            System.out.println(getName() + " truck is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            System.out.println(getName() + " truck has been returned.");
            setRented(false);
        } else {
            System.out.println(getName() + " truck is not currently rented.");
        }
    }
}
