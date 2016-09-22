package kr.ac.sungkyul.beautyline.exception;

@SuppressWarnings("serial")
public class VisitUpdateException extends RuntimeException {

	public VisitUpdateException() {
		super("방문내역 등록에 실패하였습니다.");
	}

	public VisitUpdateException(String message) {
		super(message);
	}
}
