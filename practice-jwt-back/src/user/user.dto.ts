import {IsString} from 'class-validator';

export class UserDTO {
    @IsString({
            message: 'title은 String 타입을 입력해줘야 합니다.'
    })
    email: string;
    @IsString({
      message: 'content는 string 타입을 입력해줘야 합니다.'
    })
    password: string;
}
