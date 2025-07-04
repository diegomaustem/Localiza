import { v4 as uuidv4 } from "uuid";
import { IPrivilege } from "../interfaces/IPrivilege";
import { privilegeRepository } from "../repositories/PrivilegeRepository";

class PrivilegeService {
  async getPrivileges(): Promise<IPrivilege[]> {
    try {
      return await privilegeRepository.findMany();
    } catch (error) {
      console.error("Failed to retrieve privileges.", error);
      throw error;
    }
  }

  async getPrivilege(privilegeId: string): Promise<IPrivilege | null> {
    try {
      return await privilegeRepository.findOne(privilegeId);
    } catch (error) {
      console.error("Failed to retrieve privilege.", error);
      throw error;
    }
  }

  async createPrivigele(privilege: IPrivilege): Promise<IPrivilege> {
    const newPrivilege: IPrivilege = {
      ...privilege,
      id: uuidv4(),
    };

    try {
      return await privilegeRepository.create(newPrivilege);
    } catch (error) {
      console.error("Failed to create privilege.", error);
      throw error;
    }
  }

  async updatePrivilege(
    privilegeId: string,
    privilegeData: IPrivilege
  ): Promise<IPrivilege> {
    try {
      return await privilegeRepository.update(privilegeId, privilegeData);
    } catch (error) {
      console.error("Failed to update privilege.", error);
      throw error;
    }
  }

  async deletePrivilege(privilegeId: string): Promise<IPrivilege> {
    try {
      return await privilegeRepository.delete(privilegeId);
    } catch (error) {
      console.error("Failed to delete privilege.", error);
      throw error;
    }
  }
}
export const privilegeService = new PrivilegeService();
