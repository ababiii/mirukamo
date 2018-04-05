package mirukamoVo;

public class mirukamo_question {

		String	member_id;
		int num ;
		String title;
		String content;
		int category;
		String question_date;
		char answer;
		
		public mirukamo_question() {
			super();
		}
		
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getCategory() {
			return category;
		}
		public void setCategory(int category) {
			this.category = category;
		}
		public String getQuestion_date() {
			return question_date;
		}
		public void setQuestion_date(String question_date) {
			this.question_date = question_date;
		}
		public char getAnswer() {
			return answer;
		}
		public void setAnswer(char answer) {
			this.answer = answer;
		}
		
		@Override
		public String toString() {
			return "mirukamo_question [member_id=" + member_id + ", num=" + num + ", title=" + title + ", content="
					+ content + ", category=" + category + ", question_date=" + question_date + ", answer=" + answer
					+ "]";
		}
		
		
		public mirukamo_question(String member_id, int num, String title, String content, int category,
				String question_date, char answer) {
			super();
			this.member_id = member_id;
			this.num = num;
			this.title = title;
			this.content = content;
			this.category = category;
			this.question_date = question_date;
			this.answer = answer;
		}

}
