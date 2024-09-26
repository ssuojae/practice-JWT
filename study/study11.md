## 고민했던 부분: DTO에서 PickType과 데코레이터 적용
- 프로젝트를 진행하면서, UserEntity에는 여러 프로퍼티가 존재하지만, 특정 API에서는 email과 password만 필요한 상황이었다. 
- 이를 해결하기 위해 NestJS의 PickType과 class-validator 데코레이터를 적용하여 DTO를 설계하는 과정에서 몇 가지 고민이 있었다.

### 문제 상황
- `UserEntity`는 여러 프로퍼티를 가지고 있고, 데이터베이스와 매핑되는 구조로 TypeORM과 연결되어 있다. 
- 하지만, DTO에서 필요한 필드는 `email`과 `password` 뿐이었고, 이 두 필드에 대한 값 검증 로직을 추가하고 싶었다.

```typescript
import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';
import {IsString} from "class-validator";

@Entity('users')
export class UserEntity {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column({ unique: true })
    @IsString({
        message: 'email은 String 타입을 입력해줘야 합니다.'
    })
    email: string;

    @Column()
    @IsString({
        message: 'password는 String 타입을 입력해줘야 합니다.'
    })
    password: string;

    @CreateDateColumn()
        createdAt: Date;

    @UpdateDateColumn()
        updatedAt: Date;
    }
 ```

- DTO에서는 email과 password만을 사용하고자 했기 때문에, 이 두 필드만 추출할 수 있도록 `PickType`을 사용했다.

```typescript
import {IsString} from 'class-validator';
import {UserEntity} from "./user.entity";
import {PickType} from "@nestjs/swagger";

export class UserDTO extends PickType(UserEntity, ['email', 'password']) {
    @IsString({
        message: 'email은 String 타입을 입력해줘야 합니다.'
    })
    email: string;

    @IsString({
        message: 'password는 String 타입을 입력해줘야 합니다.'
    })
       password: string;
    }
```

#### 해결 과정: PickType과 데코레이터의 조합
- 처음에는 UserEntity의 모든 속성을 DTO에서 그대로 상속받아야 할지 고민했으나, 불필요한 필드가 포함되는 것을 방지하고자 NestJS의 PickType을 사용해 email과 password만 추출했다. 
- 이 방식으로 Entity의 속성을 재사용하면서도 DTO에서는 필요한 필드만 사용하게 되었다.
- 또한, class-validator 데코레이터인 @IsString을 적용하여 필드 값에 대한 검증도 추가했다. 이를 통해 API 요청 시 DTO에서 오는 값들이 올바른 형식인지를 쉽게 검증할 수 있게 되었다.