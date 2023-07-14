package pnw.board;

public class ChatInfoBean {

    /**
     * 主キー
     */
    private int review_id;

    /**
     * ユーザID
     */
    private String reviewer_id;

    /**
     * テキスト
     */
    private String review_text;

    public ChatInfoBean(String reviewer_id, String review_text) {
        this.reviewer_id = reviewer_id;
        this.review_text = review_text;
    }

    public String getReviewer_id() {
        return reviewer_id;
    }

    public void setReviewer_id(String reviewer_id) {
        this.reviewer_id = reviewer_id;
    }

    public String getReview_text() {
        return review_text;
    }

    public void setReview_text(String review_text) {
        this.review_text = review_text;
    }

    /**
     * @return int return the review_id
     */
    public int getReview_id() {
        return review_id;
    }

    /**
     * @param review_id the review_id to set
     */
    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

}
