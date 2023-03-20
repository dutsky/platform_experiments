package com.example.platform_experiments

interface Calculator {
    fun multiply(first: Int, second: Int): Int

    fun divide(first: Int, second: Int): Float

    fun add(first: Int, second: Int): Int

    fun subtract(first: Int, second: Int): Int
}

class CalculatorImpl : Calculator {
    override fun multiply(first: Int, second: Int): Int = first * second

    override fun divide(first: Int, second: Int): Float = first.toFloat() / second

    override fun add(first: Int, second: Int): Int = first + second

    override fun subtract(first: Int, second: Int): Int = first - second

}