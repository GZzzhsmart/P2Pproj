package top.zzh.bean;
/**
 * create by 谭芳芳 on 2017/12/28
 * */
public class Progress {
    private long bytesRead;
    private long contentLength;
    private long items;

    public Progress() {
    }

    public Progress(long bytesRead, long contentLength, long items) {
        super();
        this.bytesRead = bytesRead;
        this.contentLength = contentLength;
        this.items = items;
    }

    public long getBytesRead() {
        return bytesRead;
    }
    public void setBytesRead(long bytesRead) {
        this.bytesRead = bytesRead;
    }
    public long getContentLength() {
        return contentLength;
    }
    public void setContentLength(long contentLength) {
        this.contentLength = contentLength;
    }
    public long getItems() {
        return items;
    }
    public void setItems(long items) {
        this.items = items;
    }
    @Override
    public String toString() {
        return "Progress [bytesRead=" + bytesRead + ", contentLength=" + contentLength + ", items=" + items + "]";
    }
}
