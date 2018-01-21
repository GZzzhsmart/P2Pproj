package top.zzh.common;


public class Combobox {

    private String id;
    private String text;
    private boolean selected;

    public Combobox() {
    }

    public Combobox(String id, String text, boolean selected) {
        this.id = id;
        this.text = text;
        this.selected = selected;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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
