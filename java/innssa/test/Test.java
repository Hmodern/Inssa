package innssa.test;

import innssa.dto.LikeyDTO;
import innssa.vo.LikeyVO;

public class Test {

	public static void main(String[] args) {
		
		//join test
//		UserVO vo = new UserVO();
//		UserDTO dto = new UserDTO();
//		
//		vo.setId("jimin");
//		vo.setPw("5010");
//		vo.setName("지민");
//		vo.setNick_name("모던");
//		vo.setGender("남자");
//		vo.setMbti("ENFP");
//		vo.setOne_line("한줄소개");
//		
//		dto.Join(vo);
		
		//insert test
//		BoardVO vo = new BoardVO();
//		BoardDTO dto = new BoardDTO();
//		
//		vo.setId("jimin");
//		vo.setContents("테스트 내용임");
//		vo.setType("맛집");
//		vo.setTitle("테스트 제목임");
//		
//		
//		dto.Insert(vo);
		
		
//		UserDTO dto = new UserDTO();
//		UserVO vo = dto.Login("jimin", "5010");
//		
//		System.out.println("아이디 : " + vo.getId());
//		System.out.println("이름 : " + vo.getName());
//		System.out.println("닉네임 : " + vo.getNick_name());
//		System.out.println("성별 : " + vo.getGender());
//		System.out.println("mbti : " + vo.getMbti());
//		System.out.println("한줄소개 : " + vo.getOne_line());
			
//		update test
//		BoardDTO dto = new BoardDTO();
//		BoardVO vo = new BoardVO();
//		
//		vo.setTitle("update 테스트 제목입니다.");
//		vo.setType("여행");
//		vo.setContents("update 테스트 내용입니다.");
//		vo.setNo("1");
//		dto.Update(vo);
		
//		delete test
//		BoardDTO dto = new BoardDTO();
//		dto.Delete("3");
		
		//read test
//		BoardDTO dto = new BoardDTO();
//		BoardVO vo = dto.Read("1", true);
//		
//		System.out.println("작성자 : " + vo.getName());
//		System.out.println("제목 : " + vo.getTitle());
//		System.out.println("내용 : " + vo.getContents());		
//		System.out.println("구분 : " + vo.getType());	
		
		//blikey test
		LikeyDTO dto = new LikeyDTO();
		LikeyVO vo = new LikeyVO();
		
		vo.setId("jimin");
		vo.setNo("1");
		vo.setLiker_id("mingee");
		dto.Blikey(vo,true);
		
		
		
		
	}

}
