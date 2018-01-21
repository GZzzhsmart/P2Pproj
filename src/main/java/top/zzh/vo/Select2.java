package top.zzh.vo;

/**
 * Created by XIE Shanlin on 2018.01.05.
 */
public class Select2 {

    private Long id;
    private String text;
    private boolean selected;

    public Select2() {
    }

    public Select2(Long id, String text) {
        this.id = id;
        this.text = text;
    }

    public Select2(Long id, String text, boolean selected) {
        this.id = id;
        this.text = text;
        this.selected = selected;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }
}
