import { createClient } from "./server";

export type UserProfile = {
  id: string;
  full_name: string | null;
  role: "ADMIN" | "STUDENT";
  avatar_url: string | null;
  is_active: boolean;
};

/**
 * Get the profile for the current authenticated user
 * Returns null if user is not authenticated or profile doesn't exist
 */
export async function getUserProfile(): Promise<UserProfile | null> {
  const supabase = await createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return null;
  }

  const { data: profile } = await supabase
    .from("profiles")
    .select("id, full_name, role, avatar_url, is_active")
    .eq("id", user.id)
    .single();

  return profile;
}
