import {UserEntity} from "../../user/user.entity";

export abstract class IJwtStrategy {
    abstract validate(payload: { id: string }): Promise<UserEntity>;
}
