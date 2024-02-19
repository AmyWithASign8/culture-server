import { Injectable, PipeTransform } from '@nestjs/common';
import { ObjectSchema } from 'joi';

@Injectable()
export class UserPipe implements PipeTransform {
  constructor(private readonly objectSchema: ObjectSchema) {}
}
