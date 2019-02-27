package com.eksad.xbc.model;

import java.util.List;

public class TechForm {
	private TechnologyModel tech;
	private List<TechTrainerModel> tt;
	
	public TechnologyModel getTech() {
		return tech;
	}
	public void setTech(TechnologyModel tech) {
		this.tech = tech;
	}
	public List<TechTrainerModel> getTt() {
		return tt;
	}
	public void setTt(List<TechTrainerModel> tt) {
		this.tt = tt;
	}
	
}