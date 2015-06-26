package cn.domain;
/**
 * 
 * 
 *
 */
public class Product {
	private String p_id;
	private String p_name;
	private String p_input;
	private int  p_capacity;
	private int p_current;
	private int p_maxcurrent;
	private int p_motorpower;
	private int p_weight;
	private int c_id;
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_input() {
		return p_input;
	}
	public void setP_input(String p_input) {
		this.p_input = p_input;
	}
	public int getP_capacity() {
		return p_capacity;
	}
	public void setP_capacity(int p_capacity) {
		this.p_capacity = p_capacity;
	}
	public int getP_current() {
		return p_current;
	}
	public void setP_current(int p_current) {
		this.p_current = p_current;
	}
	public int getP_maxcurrent() {
		return p_maxcurrent;
	}
	public void setP_maxcurrent(int p_maxcurrent) {
		this.p_maxcurrent = p_maxcurrent;
	}
	public int getP_motorpower() {
		return p_motorpower;
	}
	public void setP_motorpower(int p_motorpower) {
		this.p_motorpower = p_motorpower;
	}
	public int getP_weight() {
		return p_weight;
	}
	public void setP_weight(int p_weight) {
		this.p_weight = p_weight;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	@Override
	public String toString() {
		return "Product [p_id=" + p_id + ", p_name=" + p_name + ", p_input="
				+ p_input + ", p_capacity=" + p_capacity + ", p_current="
				+ p_current + ", p_maxcurrent=" + p_maxcurrent
				+ ", p_motorpower=" + p_motorpower + ", p_weight=" + p_weight
				+ ", c_id=" + c_id + "]";
	}
	
	
	
	
	
	
}
