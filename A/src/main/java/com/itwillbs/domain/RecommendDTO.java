package com.itwillbs.domain;

public class RecommendDTO {
	private String recommendIdx;
	private String movieName;
	private String director;
	private String createUser;
	private String createDate;
	private int countReco;
	private String poster;
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	private String recoUser;
	
	public String getRecommendIdx() {
		return recommendIdx;
	}
	public void setRecommendIdx(String recommendIdx) {
		this.recommendIdx = recommendIdx;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getCountReco() {
		return countReco;
	}
	public void setCountReco(int countReco) {
		this.countReco = countReco;
	}
	public String getRecoUser() {
		return recoUser;
	}
	public void setRecoUser(String recoUser) {
		this.recoUser = recoUser;
	}
	@Override
	public String toString() {
		return "RecommendDTO [recommendIdx=" + recommendIdx + ", movieName=" + movieName + ", director=" + director
				+ ", createUser=" + createUser + ", createDate=" + createDate + ", countReco=" + countReco + ", poster="
				+ poster + ", recoUser=" + recoUser + "]";
	}
	
	
}
