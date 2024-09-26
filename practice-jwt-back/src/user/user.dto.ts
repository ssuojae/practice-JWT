import { UserEntity } from './user.entity';
import { PickType } from '@nestjs/swagger';

export class UserDTO extends PickType(UserEntity,
    ['email', 'password']) {
}
