package com.itwillbs.domain;

public class MovieDTO {
	
	private String movieCategory;
	private String movieIdx; 
	private String title;
	private String director;
	private String actor;
	private String genre;
	private String startDate;
	private String endDate;
	private String openDate;
	private String rating;
	private String totalView;
	private String synopsis;
	private String filmMade;
	private String nation;
	private String runTime;
	private String poster;
	
	public String getMovieCategory() {
		return movieCategory;
	}
	public void setMovieCategory(String movieCategory) {
		this.movieCategory = movieCategory;
	}
	public String getMovieIdx() {
		return movieIdx;
	}
	public void setMovieIdx(String movieIdx) {
		this.movieIdx = movieIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getTotalView() {
		return totalView;
	}
	public void setTotalView(String totalView) {
		this.totalView = totalView;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getFilmMade() {
		return filmMade;
	}
	public void setFilmMade(String filmMade) {
		this.filmMade = filmMade;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getRunTime() {
		return runTime;
	}
	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	@Override
	public String toString() {
		return "MovieDTO [movieCategory=" + movieCategory + ", movieIdx=" + movieIdx + ", title=" + title
				+ ", director=" + director + ", actor=" + actor + ", genre=" + genre + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", openDate=" + openDate + ", rating=" + rating + ", totalView=" + totalView
				+ ", synopsis=" + synopsis + ", filmMade=" + filmMade + ", nation=" + nation + ", runTime=" + runTime
				+ ", poster=" + poster + "]";
	}
	
}
