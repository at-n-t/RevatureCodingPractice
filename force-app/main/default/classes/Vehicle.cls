//Pillars of Object Oriented Programming
/*Challenege I: Create a class called Vehicle. This class should have the following properties:
- An enum publicly available called Medium with the values LAND, AIR, WATER
- A property called Speed. This should be read-only outside of the class. This is not allowed to be negative
- A property called Name. This should be read-only outside of the class
- A property called Occupants. This is not allowed to be negative
- A constant called Capacity. This must be at least 1
- A variable called Media, which is a list of Mediums. This should only be accessible by the class and any of its children
*/
public abstract with sharing class Vehicle {

    public enum Medium {LAND, AIR, WATER}

    private static final Integer capacity = 1;

    private String name;
    private Integer speed;
    private Integer occupants;
    private List<Medium> media;

    /*Challenge II: Add the following methods to Vehicle:
    - A constructor that sets Speed, Occupants, Name, and Capacity to default values
    - A method called Accelerate which changes Speed by the specified amount
    - An abstract method called Turn
    - A method called ToString that prints out the current Speed, all Media, the Name, and the number of Occupants
    */

    public Vehicle(Integer speed, Integer occupants, String name) {
        this.speed = speed;
        this.occupants = 0;
        this.name = name;
    }

    public void accelerate(Integer amount) {
        this.speed += amount;
    }

    public abstract void Turn();

    public override String ToString() {
        return 'Speed: ' + speed + ', Media: ' + media + ', Name: ' + name + ', Occupants: ' + occupants;
    }
}