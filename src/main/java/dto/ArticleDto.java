package dto;

public class ArticleDto {
    private String title;
    private String summary;
    private int price_s;
    private int price_l;
    private String category;
    private String imageUrl;
    private int views;
    private int likes;

    public ArticleDto(String title, String summary, int price_s, int price_l, String category, String imageUrl, int views, int likes) {
        this.title = title;
        this.summary = summary;
        this.price_s = price_s;
        this.price_l = price_l;
        this.category = category;
        this.imageUrl = imageUrl;
        this.views = views;
        this.likes = likes;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getPrice_s() {
        return price_s;
    }

    public void setPrice_s(int price_s) {
        this.price_s = price_s;
    }

    public int getPrice_l() {
        return price_l;
    }

    public void setPrice_l(int price_l) {
        this.price_l = price_l;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }
}
